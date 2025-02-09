/**
A Dagger pipeline for Ruby generated via Magicinit™

                       _      _       _ _   
                      (_)    (_)     (_) |  
 _ __ ___   __ _  __ _ _  ___ _ _ __  _| |_ 
| '_ ` _ \ / _` |/ _` | |/ __| | '_ \| | __|
| | | | | | (_| | (_| | | (__| | | | | | |_ 
|_| |_| |_|\__,_|\__, |_|\___|_|_| |_|_|\__|
                  __/ |                     
                 |___/    
                 
We wish this example was written in Ruby, please join us in 
discord to help us make this a reality: https://discord.com/invite/dagger-io
 */
import { dag, Container, Directory, object, func, argument } from "@dagger.io/dagger"

@object()
class Ruby {
  // [heads up] We could not infer the ruby version, so we default to latest
  rubyVersion: string = "latest"
  source: Directory

  @func()
  ctr: Container

  /**
   * Module level arguments using constructor
   * @param source location of source code, defaults to current working dir
   *
   * more info on defaultPath: https://docs.dagger.io/manuals/developer/functions/#directories-and-files
   * more info on constructor: https://docs.dagger.io/manuals/developer/entrypoint-function/
   */
  constructor(@argument({ defaultPath: "/" }) source: Directory) {
    this.source = source
    this.ctr = dag.container()
  }

  /**
   * Base container for Ruby project
   */
  @func()
  base(): Ruby {
    this.ctr = dag.
      container().
      from(`ruby:${this.rubyVersion}`).
      withMountedDirectory("/src", this.source).
      withWorkdir("/src")

    return this
  }

  /**
   * Build the project
   */
  @func()
  build(): Ruby {
    this.ctr = this.ctr.withExec(["bundle", "install"])

    return this
  }

  /**
   * Lint the project
   */
  @func()
  lint(): Container {
    return this.ctr.withExec(["bundle", "exec", "rubocop"])
  }

  /**
   * Test the project
   */
  @func()
  test(): Container {
    return this.ctr.withExec(["bundle", "exec", "rspec"])
  }

  /**
   * Run the CI pipeline
   */
  @func()
  async ci(): Promise<void> {
    // Install deps if that's not already been done
    this.base().build()

    await Promise.all([
      this.lint().sync(),
      this.test().sync(),
    ])
  }
}

