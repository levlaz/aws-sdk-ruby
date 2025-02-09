# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE


module Aws::ApplicationDiscoveryService
  module Plugins
    class Endpoints < Seahorse::Client::Plugin
      option(
        :endpoint_provider,
        doc_type: 'Aws::ApplicationDiscoveryService::EndpointProvider',
        rbs_type: 'untyped',
        docstring: <<~DOCS) do |_cfg|
The endpoint provider used to resolve endpoints. Any object that responds to
`#resolve_endpoint(parameters)` where `parameters` is a Struct similar to
`Aws::ApplicationDiscoveryService::EndpointParameters`.
        DOCS
        Aws::ApplicationDiscoveryService::EndpointProvider.new
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
          when :associate_configuration_items_to_application
            Aws::ApplicationDiscoveryService::Endpoints::AssociateConfigurationItemsToApplication.build(context)
          when :batch_delete_agents
            Aws::ApplicationDiscoveryService::Endpoints::BatchDeleteAgents.build(context)
          when :batch_delete_import_data
            Aws::ApplicationDiscoveryService::Endpoints::BatchDeleteImportData.build(context)
          when :create_application
            Aws::ApplicationDiscoveryService::Endpoints::CreateApplication.build(context)
          when :create_tags
            Aws::ApplicationDiscoveryService::Endpoints::CreateTags.build(context)
          when :delete_applications
            Aws::ApplicationDiscoveryService::Endpoints::DeleteApplications.build(context)
          when :delete_tags
            Aws::ApplicationDiscoveryService::Endpoints::DeleteTags.build(context)
          when :describe_agents
            Aws::ApplicationDiscoveryService::Endpoints::DescribeAgents.build(context)
          when :describe_batch_delete_configuration_task
            Aws::ApplicationDiscoveryService::Endpoints::DescribeBatchDeleteConfigurationTask.build(context)
          when :describe_configurations
            Aws::ApplicationDiscoveryService::Endpoints::DescribeConfigurations.build(context)
          when :describe_continuous_exports
            Aws::ApplicationDiscoveryService::Endpoints::DescribeContinuousExports.build(context)
          when :describe_export_configurations
            Aws::ApplicationDiscoveryService::Endpoints::DescribeExportConfigurations.build(context)
          when :describe_export_tasks
            Aws::ApplicationDiscoveryService::Endpoints::DescribeExportTasks.build(context)
          when :describe_import_tasks
            Aws::ApplicationDiscoveryService::Endpoints::DescribeImportTasks.build(context)
          when :describe_tags
            Aws::ApplicationDiscoveryService::Endpoints::DescribeTags.build(context)
          when :disassociate_configuration_items_from_application
            Aws::ApplicationDiscoveryService::Endpoints::DisassociateConfigurationItemsFromApplication.build(context)
          when :export_configurations
            Aws::ApplicationDiscoveryService::Endpoints::ExportConfigurations.build(context)
          when :get_discovery_summary
            Aws::ApplicationDiscoveryService::Endpoints::GetDiscoverySummary.build(context)
          when :list_configurations
            Aws::ApplicationDiscoveryService::Endpoints::ListConfigurations.build(context)
          when :list_server_neighbors
            Aws::ApplicationDiscoveryService::Endpoints::ListServerNeighbors.build(context)
          when :start_batch_delete_configuration_task
            Aws::ApplicationDiscoveryService::Endpoints::StartBatchDeleteConfigurationTask.build(context)
          when :start_continuous_export
            Aws::ApplicationDiscoveryService::Endpoints::StartContinuousExport.build(context)
          when :start_data_collection_by_agent_ids
            Aws::ApplicationDiscoveryService::Endpoints::StartDataCollectionByAgentIds.build(context)
          when :start_export_task
            Aws::ApplicationDiscoveryService::Endpoints::StartExportTask.build(context)
          when :start_import_task
            Aws::ApplicationDiscoveryService::Endpoints::StartImportTask.build(context)
          when :stop_continuous_export
            Aws::ApplicationDiscoveryService::Endpoints::StopContinuousExport.build(context)
          when :stop_data_collection_by_agent_ids
            Aws::ApplicationDiscoveryService::Endpoints::StopDataCollectionByAgentIds.build(context)
          when :update_application
            Aws::ApplicationDiscoveryService::Endpoints::UpdateApplication.build(context)
          end
        end
      end

      def add_handlers(handlers, _config)
        handlers.add(Handler, step: :build, priority: 75)
      end
    end
  end
end
