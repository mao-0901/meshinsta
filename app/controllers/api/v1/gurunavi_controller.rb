class Api::V1::GurunaviController < ApplicationController
	require 'json'
	require 'net/http'
  require 'uri'


	def new
	end

	def search
		word = params[:search]

		data={
      "keyid": "3bcaa2b3599317db755b92eeb01cd7ef",
      "freeword": word
		}
		query = data.to_query
		uri = "https://api.gnavi.co.jp/RestSearchAPI/v3/?" + query
		url = URI.parse uri
		json = Net::HTTP.get(url)
		results = JSON.parse(json)
		@shops = results['rest']
		
	# 	url = URI.encode url
	# 	p url
	# 	json = open(url)
	# 	puts "aaaaaaaaaaaaaaaaaaaaaa"
	# 	hash = Hash.from_xml json
	# 	puts '=============='
	# 	shops = []
	# 	puts shops

  #   if hash.has_key?("response")
  #     hash["response"]["rest"].each do |shop|
  #       shops.push({
  #         name: shop["name"],
  #         url: shop["url"],
  #         opentime: shop["opentime"],
  #         holiday: shop["holiday"],
  #         image1: shop["image_url"]["shop_image1"],
  #         image2: shop["image_url"]["shop_image2"]
  #       })
  #     end
  #   elsif hash.has_key?("gnavi")
  #     if hash["gnavi"].has_key?("error")
  #         if hash["gnavi"]["error"]["code"] == "600"
  #           @error = "該当する店舗の情報が存在しません"
  #         end
  #     end
  #   else
  #     @error = "エラーが発生しました"
  #   end

  #   rescue
  #     @error = "エラーが発生しました"
  #   end
	 end
	end