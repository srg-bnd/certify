# frozen_string_literal: true

module Domains
  class API < Grape::API
    version :v1

    helpers APIHelpers::PaginationHelper

    desc I18n.t('domains.api.index.desc')
    get do
      domains = Domains::IndexService.new.call(params).data
      domains = pagination(domains)
      present domains, with: DomainEntity
    end

    desc I18n.t('domains.api.create.desc')
    params { requires :name, type: String }
    post do
      result = Domains::CreationService.new.call(params)
      if result.success?
        present result.data, with: DomainEntity
      else
        error!({ error: result.data }, 200)
      end
    end

    route_param :id do
      before do
        @domain = Domain.find(params[:id])
      end

      desc I18n.t('domains.api.track.desc')
      post :track do
        result = Domains::TrackingService.new(@domain).call
        if result.success?
          present result.data, with: DomainEntity
        else
          error!({ error: result.data }, 200)
        end
      end

      desc I18n.t('domains.api.untrack.desc')
      post :untrack do
        result = Domains::UntrackingService.new(@domain).call
        if result.success?
          present result.data, with: DomainEntity
        else
          error!({ error: result.data }, 200)
        end
      end

      desc I18n.t('domains.api.destroy.desc')
      delete do
        result = Domains::DeletionService.new(@domain).call
        if result.success?
          status 200
        else
          error!({ error: result.data }, 200)
        end
      end
    end
  end
end
