require 'linguist'

class DashboardController < ApplicationController
  def index
    platform = params["platform"] || "ios"
    repo = Rugged::Repository.new("tmp/repos/mobiel-bankieren-#{platform}")
    @languages = Linguist::Repository.new(repo, repo.head.target_id).languages.to_h
    @files = repo.index.map { |file| [File.basename(file[:path]), Random.rand(1000)] }.to_h#.sort_by {|k,v| v}.reverse
  end
end
