# coding: utf-8
require 'sinatra'
require 'okura'
require 'okura/serializer'
require 'json'

tagger = Okura::Serializer::FormatInfo.create_tagger('./dic')

get '/:str' do
  content_type :json

  nodes = tagger.parse(params[:str])
  nodes.mincost_path.map {|node|
    word = node.word

    {
      surface: word.surface,
      text:    word.right.text,
      cost:    word.cost
    }
  }.to_json
end

get '/' do
  '/形態素解析したい文字列'
end
