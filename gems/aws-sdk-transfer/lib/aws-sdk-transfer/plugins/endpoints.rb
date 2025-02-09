# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE


module Aws::Transfer
  module Plugins
    class Endpoints < Seahorse::Client::Plugin
      option(
        :endpoint_provider,
        doc_type: 'Aws::Transfer::EndpointProvider',
        rbs_type: 'untyped',
        docstring: <<~DOCS) do |_cfg|
The endpoint provider used to resolve endpoints. Any object that responds to
`#resolve_endpoint(parameters)` where `parameters` is a Struct similar to
`Aws::Transfer::EndpointParameters`.
        DOCS
        Aws::Transfer::EndpointProvider.new
      end

      # @api private
      class Handler < Seahorse::Client::Handler
        def call(context)
          unless context[:discovered_endpoint]
            params = parameters_for_operation(context)
            endpoint = context.config.endpoint_provider.resolve_endpoint(params)

            context.http_request.endpoint = endpoint.url
            apply_endpoint_headers(context, endpoint.headers)

            context[:endpoint_params] = params
            context[:endpoint_properties] = endpoint.properties
          end

          context[:auth_scheme] =
            Aws::Endpoints.resolve_auth_scheme(context, endpoint)

          with_metrics(context) { @handler.call(context) }
        end

        private

        def with_metrics(context, &block)
          metrics = []
          metrics << 'ENDPOINT_OVERRIDE' unless context.config.regional_endpoint
          if context[:auth_scheme] && context[:auth_scheme]['name'] == 'sigv4a'
            metrics << 'SIGV4A_SIGNING'
          end
          if context.config.credentials&.credentials&.account_id
            metrics << 'RESOLVED_ACCOUNT_ID'
          end
          Aws::Plugins::UserAgent.metric(*metrics, &block)
        end

        def apply_endpoint_headers(context, headers)
          headers.each do |key, values|
            value = values
              .compact
              .map { |s| Seahorse::Util.escape_header_list_string(s.to_s) }
              .join(',')

            context.http_request.headers[key] = value
          end
        end

        def parameters_for_operation(context)
          case context.operation_name
          when :create_access
            Aws::Transfer::Endpoints::CreateAccess.build(context)
          when :create_agreement
            Aws::Transfer::Endpoints::CreateAgreement.build(context)
          when :create_connector
            Aws::Transfer::Endpoints::CreateConnector.build(context)
          when :create_profile
            Aws::Transfer::Endpoints::CreateProfile.build(context)
          when :create_server
            Aws::Transfer::Endpoints::CreateServer.build(context)
          when :create_user
            Aws::Transfer::Endpoints::CreateUser.build(context)
          when :create_workflow
            Aws::Transfer::Endpoints::CreateWorkflow.build(context)
          when :delete_access
            Aws::Transfer::Endpoints::DeleteAccess.build(context)
          when :delete_agreement
            Aws::Transfer::Endpoints::DeleteAgreement.build(context)
          when :delete_certificate
            Aws::Transfer::Endpoints::DeleteCertificate.build(context)
          when :delete_connector
            Aws::Transfer::Endpoints::DeleteConnector.build(context)
          when :delete_host_key
            Aws::Transfer::Endpoints::DeleteHostKey.build(context)
          when :delete_profile
            Aws::Transfer::Endpoints::DeleteProfile.build(context)
          when :delete_server
            Aws::Transfer::Endpoints::DeleteServer.build(context)
          when :delete_ssh_public_key
            Aws::Transfer::Endpoints::DeleteSshPublicKey.build(context)
          when :delete_user
            Aws::Transfer::Endpoints::DeleteUser.build(context)
          when :delete_workflow
            Aws::Transfer::Endpoints::DeleteWorkflow.build(context)
          when :describe_access
            Aws::Transfer::Endpoints::DescribeAccess.build(context)
          when :describe_agreement
            Aws::Transfer::Endpoints::DescribeAgreement.build(context)
          when :describe_certificate
            Aws::Transfer::Endpoints::DescribeCertificate.build(context)
          when :describe_connector
            Aws::Transfer::Endpoints::DescribeConnector.build(context)
          when :describe_execution
            Aws::Transfer::Endpoints::DescribeExecution.build(context)
          when :describe_host_key
            Aws::Transfer::Endpoints::DescribeHostKey.build(context)
          when :describe_profile
            Aws::Transfer::Endpoints::DescribeProfile.build(context)
          when :describe_security_policy
            Aws::Transfer::Endpoints::DescribeSecurityPolicy.build(context)
          when :describe_server
            Aws::Transfer::Endpoints::DescribeServer.build(context)
          when :describe_user
            Aws::Transfer::Endpoints::DescribeUser.build(context)
          when :describe_workflow
            Aws::Transfer::Endpoints::DescribeWorkflow.build(context)
          when :import_certificate
            Aws::Transfer::Endpoints::ImportCertificate.build(context)
          when :import_host_key
            Aws::Transfer::Endpoints::ImportHostKey.build(context)
          when :import_ssh_public_key
            Aws::Transfer::Endpoints::ImportSshPublicKey.build(context)
          when :list_accesses
            Aws::Transfer::Endpoints::ListAccesses.build(context)
          when :list_agreements
            Aws::Transfer::Endpoints::ListAgreements.build(context)
          when :list_certificates
            Aws::Transfer::Endpoints::ListCertificates.build(context)
          when :list_connectors
            Aws::Transfer::Endpoints::ListConnectors.build(context)
          when :list_executions
            Aws::Transfer::Endpoints::ListExecutions.build(context)
          when :list_host_keys
            Aws::Transfer::Endpoints::ListHostKeys.build(context)
          when :list_profiles
            Aws::Transfer::Endpoints::ListProfiles.build(context)
          when :list_security_policies
            Aws::Transfer::Endpoints::ListSecurityPolicies.build(context)
          when :list_servers
            Aws::Transfer::Endpoints::ListServers.build(context)
          when :list_tags_for_resource
            Aws::Transfer::Endpoints::ListTagsForResource.build(context)
          when :list_users
            Aws::Transfer::Endpoints::ListUsers.build(context)
          when :list_workflows
            Aws::Transfer::Endpoints::ListWorkflows.build(context)
          when :send_workflow_step_state
            Aws::Transfer::Endpoints::SendWorkflowStepState.build(context)
          when :start_directory_listing
            Aws::Transfer::Endpoints::StartDirectoryListing.build(context)
          when :start_file_transfer
            Aws::Transfer::Endpoints::StartFileTransfer.build(context)
          when :start_server
            Aws::Transfer::Endpoints::StartServer.build(context)
          when :stop_server
            Aws::Transfer::Endpoints::StopServer.build(context)
          when :tag_resource
            Aws::Transfer::Endpoints::TagResource.build(context)
          when :test_connection
            Aws::Transfer::Endpoints::TestConnection.build(context)
          when :test_identity_provider
            Aws::Transfer::Endpoints::TestIdentityProvider.build(context)
          when :untag_resource
            Aws::Transfer::Endpoints::UntagResource.build(context)
          when :update_access
            Aws::Transfer::Endpoints::UpdateAccess.build(context)
          when :update_agreement
            Aws::Transfer::Endpoints::UpdateAgreement.build(context)
          when :update_certificate
            Aws::Transfer::Endpoints::UpdateCertificate.build(context)
          when :update_connector
            Aws::Transfer::Endpoints::UpdateConnector.build(context)
          when :update_host_key
            Aws::Transfer::Endpoints::UpdateHostKey.build(context)
          when :update_profile
            Aws::Transfer::Endpoints::UpdateProfile.build(context)
          when :update_server
            Aws::Transfer::Endpoints::UpdateServer.build(context)
          when :update_user
            Aws::Transfer::Endpoints::UpdateUser.build(context)
          end
        end
      end

      def add_handlers(handlers, _config)
        handlers.add(Handler, step: :build, priority: 75)
      end
    end
  end
end
