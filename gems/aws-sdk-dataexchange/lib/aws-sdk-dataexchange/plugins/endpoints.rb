# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE


module Aws::DataExchange
  module Plugins
    class Endpoints < Seahorse::Client::Plugin
      option(
        :endpoint_provider,
        doc_type: 'Aws::DataExchange::EndpointProvider',
        rbs_type: 'untyped',
        docstring: <<~DOCS) do |_cfg|
The endpoint provider used to resolve endpoints. Any object that responds to
`#resolve_endpoint(parameters)` where `parameters` is a Struct similar to
`Aws::DataExchange::EndpointParameters`.
        DOCS
        Aws::DataExchange::EndpointProvider.new
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
          when :cancel_job
            Aws::DataExchange::Endpoints::CancelJob.build(context)
          when :create_data_set
            Aws::DataExchange::Endpoints::CreateDataSet.build(context)
          when :create_event_action
            Aws::DataExchange::Endpoints::CreateEventAction.build(context)
          when :create_job
            Aws::DataExchange::Endpoints::CreateJob.build(context)
          when :create_revision
            Aws::DataExchange::Endpoints::CreateRevision.build(context)
          when :delete_asset
            Aws::DataExchange::Endpoints::DeleteAsset.build(context)
          when :delete_data_set
            Aws::DataExchange::Endpoints::DeleteDataSet.build(context)
          when :delete_event_action
            Aws::DataExchange::Endpoints::DeleteEventAction.build(context)
          when :delete_revision
            Aws::DataExchange::Endpoints::DeleteRevision.build(context)
          when :get_asset
            Aws::DataExchange::Endpoints::GetAsset.build(context)
          when :get_data_set
            Aws::DataExchange::Endpoints::GetDataSet.build(context)
          when :get_event_action
            Aws::DataExchange::Endpoints::GetEventAction.build(context)
          when :get_job
            Aws::DataExchange::Endpoints::GetJob.build(context)
          when :get_revision
            Aws::DataExchange::Endpoints::GetRevision.build(context)
          when :list_data_set_revisions
            Aws::DataExchange::Endpoints::ListDataSetRevisions.build(context)
          when :list_data_sets
            Aws::DataExchange::Endpoints::ListDataSets.build(context)
          when :list_event_actions
            Aws::DataExchange::Endpoints::ListEventActions.build(context)
          when :list_jobs
            Aws::DataExchange::Endpoints::ListJobs.build(context)
          when :list_revision_assets
            Aws::DataExchange::Endpoints::ListRevisionAssets.build(context)
          when :list_tags_for_resource
            Aws::DataExchange::Endpoints::ListTagsForResource.build(context)
          when :revoke_revision
            Aws::DataExchange::Endpoints::RevokeRevision.build(context)
          when :send_api_asset
            Aws::DataExchange::Endpoints::SendApiAsset.build(context)
          when :send_data_set_notification
            Aws::DataExchange::Endpoints::SendDataSetNotification.build(context)
          when :start_job
            Aws::DataExchange::Endpoints::StartJob.build(context)
          when :tag_resource
            Aws::DataExchange::Endpoints::TagResource.build(context)
          when :untag_resource
            Aws::DataExchange::Endpoints::UntagResource.build(context)
          when :update_asset
            Aws::DataExchange::Endpoints::UpdateAsset.build(context)
          when :update_data_set
            Aws::DataExchange::Endpoints::UpdateDataSet.build(context)
          when :update_event_action
            Aws::DataExchange::Endpoints::UpdateEventAction.build(context)
          when :update_revision
            Aws::DataExchange::Endpoints::UpdateRevision.build(context)
          end
        end
      end

      def add_handlers(handlers, _config)
        handlers.add(Handler, step: :build, priority: 75)
      end
    end
  end
end
