# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE


module Aws::PinpointSMSVoiceV2
  module Plugins
    class Endpoints < Seahorse::Client::Plugin
      option(
        :endpoint_provider,
        doc_type: 'Aws::PinpointSMSVoiceV2::EndpointProvider',
        rbs_type: 'untyped',
        docstring: <<~DOCS) do |_cfg|
The endpoint provider used to resolve endpoints. Any object that responds to
`#resolve_endpoint(parameters)` where `parameters` is a Struct similar to
`Aws::PinpointSMSVoiceV2::EndpointParameters`.
        DOCS
        Aws::PinpointSMSVoiceV2::EndpointProvider.new
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
          when :associate_origination_identity
            Aws::PinpointSMSVoiceV2::Endpoints::AssociateOriginationIdentity.build(context)
          when :associate_protect_configuration
            Aws::PinpointSMSVoiceV2::Endpoints::AssociateProtectConfiguration.build(context)
          when :create_configuration_set
            Aws::PinpointSMSVoiceV2::Endpoints::CreateConfigurationSet.build(context)
          when :create_event_destination
            Aws::PinpointSMSVoiceV2::Endpoints::CreateEventDestination.build(context)
          when :create_opt_out_list
            Aws::PinpointSMSVoiceV2::Endpoints::CreateOptOutList.build(context)
          when :create_pool
            Aws::PinpointSMSVoiceV2::Endpoints::CreatePool.build(context)
          when :create_protect_configuration
            Aws::PinpointSMSVoiceV2::Endpoints::CreateProtectConfiguration.build(context)
          when :create_registration
            Aws::PinpointSMSVoiceV2::Endpoints::CreateRegistration.build(context)
          when :create_registration_association
            Aws::PinpointSMSVoiceV2::Endpoints::CreateRegistrationAssociation.build(context)
          when :create_registration_attachment
            Aws::PinpointSMSVoiceV2::Endpoints::CreateRegistrationAttachment.build(context)
          when :create_registration_version
            Aws::PinpointSMSVoiceV2::Endpoints::CreateRegistrationVersion.build(context)
          when :create_verified_destination_number
            Aws::PinpointSMSVoiceV2::Endpoints::CreateVerifiedDestinationNumber.build(context)
          when :delete_account_default_protect_configuration
            Aws::PinpointSMSVoiceV2::Endpoints::DeleteAccountDefaultProtectConfiguration.build(context)
          when :delete_configuration_set
            Aws::PinpointSMSVoiceV2::Endpoints::DeleteConfigurationSet.build(context)
          when :delete_default_message_type
            Aws::PinpointSMSVoiceV2::Endpoints::DeleteDefaultMessageType.build(context)
          when :delete_default_sender_id
            Aws::PinpointSMSVoiceV2::Endpoints::DeleteDefaultSenderId.build(context)
          when :delete_event_destination
            Aws::PinpointSMSVoiceV2::Endpoints::DeleteEventDestination.build(context)
          when :delete_keyword
            Aws::PinpointSMSVoiceV2::Endpoints::DeleteKeyword.build(context)
          when :delete_media_message_spend_limit_override
            Aws::PinpointSMSVoiceV2::Endpoints::DeleteMediaMessageSpendLimitOverride.build(context)
          when :delete_opt_out_list
            Aws::PinpointSMSVoiceV2::Endpoints::DeleteOptOutList.build(context)
          when :delete_opted_out_number
            Aws::PinpointSMSVoiceV2::Endpoints::DeleteOptedOutNumber.build(context)
          when :delete_pool
            Aws::PinpointSMSVoiceV2::Endpoints::DeletePool.build(context)
          when :delete_protect_configuration
            Aws::PinpointSMSVoiceV2::Endpoints::DeleteProtectConfiguration.build(context)
          when :delete_registration
            Aws::PinpointSMSVoiceV2::Endpoints::DeleteRegistration.build(context)
          when :delete_registration_attachment
            Aws::PinpointSMSVoiceV2::Endpoints::DeleteRegistrationAttachment.build(context)
          when :delete_registration_field_value
            Aws::PinpointSMSVoiceV2::Endpoints::DeleteRegistrationFieldValue.build(context)
          when :delete_resource_policy
            Aws::PinpointSMSVoiceV2::Endpoints::DeleteResourcePolicy.build(context)
          when :delete_text_message_spend_limit_override
            Aws::PinpointSMSVoiceV2::Endpoints::DeleteTextMessageSpendLimitOverride.build(context)
          when :delete_verified_destination_number
            Aws::PinpointSMSVoiceV2::Endpoints::DeleteVerifiedDestinationNumber.build(context)
          when :delete_voice_message_spend_limit_override
            Aws::PinpointSMSVoiceV2::Endpoints::DeleteVoiceMessageSpendLimitOverride.build(context)
          when :describe_account_attributes
            Aws::PinpointSMSVoiceV2::Endpoints::DescribeAccountAttributes.build(context)
          when :describe_account_limits
            Aws::PinpointSMSVoiceV2::Endpoints::DescribeAccountLimits.build(context)
          when :describe_configuration_sets
            Aws::PinpointSMSVoiceV2::Endpoints::DescribeConfigurationSets.build(context)
          when :describe_keywords
            Aws::PinpointSMSVoiceV2::Endpoints::DescribeKeywords.build(context)
          when :describe_opt_out_lists
            Aws::PinpointSMSVoiceV2::Endpoints::DescribeOptOutLists.build(context)
          when :describe_opted_out_numbers
            Aws::PinpointSMSVoiceV2::Endpoints::DescribeOptedOutNumbers.build(context)
          when :describe_phone_numbers
            Aws::PinpointSMSVoiceV2::Endpoints::DescribePhoneNumbers.build(context)
          when :describe_pools
            Aws::PinpointSMSVoiceV2::Endpoints::DescribePools.build(context)
          when :describe_protect_configurations
            Aws::PinpointSMSVoiceV2::Endpoints::DescribeProtectConfigurations.build(context)
          when :describe_registration_attachments
            Aws::PinpointSMSVoiceV2::Endpoints::DescribeRegistrationAttachments.build(context)
          when :describe_registration_field_definitions
            Aws::PinpointSMSVoiceV2::Endpoints::DescribeRegistrationFieldDefinitions.build(context)
          when :describe_registration_field_values
            Aws::PinpointSMSVoiceV2::Endpoints::DescribeRegistrationFieldValues.build(context)
          when :describe_registration_section_definitions
            Aws::PinpointSMSVoiceV2::Endpoints::DescribeRegistrationSectionDefinitions.build(context)
          when :describe_registration_type_definitions
            Aws::PinpointSMSVoiceV2::Endpoints::DescribeRegistrationTypeDefinitions.build(context)
          when :describe_registration_versions
            Aws::PinpointSMSVoiceV2::Endpoints::DescribeRegistrationVersions.build(context)
          when :describe_registrations
            Aws::PinpointSMSVoiceV2::Endpoints::DescribeRegistrations.build(context)
          when :describe_sender_ids
            Aws::PinpointSMSVoiceV2::Endpoints::DescribeSenderIds.build(context)
          when :describe_spend_limits
            Aws::PinpointSMSVoiceV2::Endpoints::DescribeSpendLimits.build(context)
          when :describe_verified_destination_numbers
            Aws::PinpointSMSVoiceV2::Endpoints::DescribeVerifiedDestinationNumbers.build(context)
          when :disassociate_origination_identity
            Aws::PinpointSMSVoiceV2::Endpoints::DisassociateOriginationIdentity.build(context)
          when :disassociate_protect_configuration
            Aws::PinpointSMSVoiceV2::Endpoints::DisassociateProtectConfiguration.build(context)
          when :discard_registration_version
            Aws::PinpointSMSVoiceV2::Endpoints::DiscardRegistrationVersion.build(context)
          when :get_protect_configuration_country_rule_set
            Aws::PinpointSMSVoiceV2::Endpoints::GetProtectConfigurationCountryRuleSet.build(context)
          when :get_resource_policy
            Aws::PinpointSMSVoiceV2::Endpoints::GetResourcePolicy.build(context)
          when :list_pool_origination_identities
            Aws::PinpointSMSVoiceV2::Endpoints::ListPoolOriginationIdentities.build(context)
          when :list_registration_associations
            Aws::PinpointSMSVoiceV2::Endpoints::ListRegistrationAssociations.build(context)
          when :list_tags_for_resource
            Aws::PinpointSMSVoiceV2::Endpoints::ListTagsForResource.build(context)
          when :put_keyword
            Aws::PinpointSMSVoiceV2::Endpoints::PutKeyword.build(context)
          when :put_opted_out_number
            Aws::PinpointSMSVoiceV2::Endpoints::PutOptedOutNumber.build(context)
          when :put_registration_field_value
            Aws::PinpointSMSVoiceV2::Endpoints::PutRegistrationFieldValue.build(context)
          when :put_resource_policy
            Aws::PinpointSMSVoiceV2::Endpoints::PutResourcePolicy.build(context)
          when :release_phone_number
            Aws::PinpointSMSVoiceV2::Endpoints::ReleasePhoneNumber.build(context)
          when :release_sender_id
            Aws::PinpointSMSVoiceV2::Endpoints::ReleaseSenderId.build(context)
          when :request_phone_number
            Aws::PinpointSMSVoiceV2::Endpoints::RequestPhoneNumber.build(context)
          when :request_sender_id
            Aws::PinpointSMSVoiceV2::Endpoints::RequestSenderId.build(context)
          when :send_destination_number_verification_code
            Aws::PinpointSMSVoiceV2::Endpoints::SendDestinationNumberVerificationCode.build(context)
          when :send_media_message
            Aws::PinpointSMSVoiceV2::Endpoints::SendMediaMessage.build(context)
          when :send_text_message
            Aws::PinpointSMSVoiceV2::Endpoints::SendTextMessage.build(context)
          when :send_voice_message
            Aws::PinpointSMSVoiceV2::Endpoints::SendVoiceMessage.build(context)
          when :set_account_default_protect_configuration
            Aws::PinpointSMSVoiceV2::Endpoints::SetAccountDefaultProtectConfiguration.build(context)
          when :set_default_message_type
            Aws::PinpointSMSVoiceV2::Endpoints::SetDefaultMessageType.build(context)
          when :set_default_sender_id
            Aws::PinpointSMSVoiceV2::Endpoints::SetDefaultSenderId.build(context)
          when :set_media_message_spend_limit_override
            Aws::PinpointSMSVoiceV2::Endpoints::SetMediaMessageSpendLimitOverride.build(context)
          when :set_text_message_spend_limit_override
            Aws::PinpointSMSVoiceV2::Endpoints::SetTextMessageSpendLimitOverride.build(context)
          when :set_voice_message_spend_limit_override
            Aws::PinpointSMSVoiceV2::Endpoints::SetVoiceMessageSpendLimitOverride.build(context)
          when :submit_registration_version
            Aws::PinpointSMSVoiceV2::Endpoints::SubmitRegistrationVersion.build(context)
          when :tag_resource
            Aws::PinpointSMSVoiceV2::Endpoints::TagResource.build(context)
          when :untag_resource
            Aws::PinpointSMSVoiceV2::Endpoints::UntagResource.build(context)
          when :update_event_destination
            Aws::PinpointSMSVoiceV2::Endpoints::UpdateEventDestination.build(context)
          when :update_phone_number
            Aws::PinpointSMSVoiceV2::Endpoints::UpdatePhoneNumber.build(context)
          when :update_pool
            Aws::PinpointSMSVoiceV2::Endpoints::UpdatePool.build(context)
          when :update_protect_configuration
            Aws::PinpointSMSVoiceV2::Endpoints::UpdateProtectConfiguration.build(context)
          when :update_protect_configuration_country_rule_set
            Aws::PinpointSMSVoiceV2::Endpoints::UpdateProtectConfigurationCountryRuleSet.build(context)
          when :update_sender_id
            Aws::PinpointSMSVoiceV2::Endpoints::UpdateSenderId.build(context)
          when :verify_destination_number
            Aws::PinpointSMSVoiceV2::Endpoints::VerifyDestinationNumber.build(context)
          end
        end
      end

      def add_handlers(handlers, _config)
        handlers.add(Handler, step: :build, priority: 75)
      end
    end
  end
end
