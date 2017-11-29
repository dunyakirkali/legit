require 'linguist'

class DashboardController < ApplicationController
  def index
    repo = Rugged::Repository.new('tmp/repos/loyo')
    @project = Linguist::Repository.new(repo, repo.head.target_id)
  end
end
