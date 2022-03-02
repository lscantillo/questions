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
        render json: { message: "#{sentence.text.content}" , status: 	:conflict, needs_review: true}
      end
    end
    if reject == false
      render json: { message: "Text is OK", status: :ok, needs_review: false}
    end
  end
end
