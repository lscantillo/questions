class Api::TonesController < ApplicationController
  require "google/cloud/language/v1" # needed
  def tone
    client = ::Google::Cloud::Language::V1::LanguageService::Client.new
    text_content = params[:text_content]
    request = ::Google::Cloud::Language::V1::AnalyzeSentimentRequest.new(document:{content: text_content, type: :PLAIN_TEXT})
    response = client.analyze_sentiment request
    reject = false
    response.sentences.each do |sentence|
      if sentence.sentiment.score <= -0.8
        reject = true
        render json: { message: "Please review the tone of the following sentence: #{sentence.text.content}" }, status: :conflict
      end
    end
    if reject == false
      render json: { message: "Text is OK", status: :ok}
    end
  end
end
# http://127.0.0.1:3000/api/tones/Why%20is%20that%20some%20apprentices%20that%20just%20joined%20wizeline%20with%20very%20few%20years%20of%20experience%20and%20definitely%20less%20skills%20(which%20is%20why%20they%20are%20apprentice)%20have%20a%20greater%20level%20and%20salary%20than%20some%20mentors%3F
