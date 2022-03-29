# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      definitions: {
        comment: {
          type: 'object',
          properties: {
            text_content: { type: :string },
            question_id: { type: :integer }
          },
          required: [ 'text_content', 'question_id' ]
        },
        department: {
          type: 'object',
          properties: {
            name: { type: :string },
            abbreviation: { type: :string },
            is_active: { type: :boolean }
          },
          required: [ 'name', 'is_active' ]
        },
        employee: {
          type: 'object',
          properties: {
            full_name: { type: :string },
            email: { type: :string },
            is_admin: { type: :boolean },
            job_title: { type: :string },
            profile_picture_url: { type: :string }
          },
          required: [ 'full_name', 'email' ]
        },
        location:{
          type: 'object',
          properties: {
            name: { type: :string },
            code: { type: :string }
          },
          required: [ 'name', 'code' ]
        },
        question:{
          type: 'object',
          properties: {
            header: { type: :string },
            text_content: { type: :string },
            is_anonymous: { type: :boolean },
            employee_id: { type: :integer },
            assigned_to_employee_id: { type: :integer },
            department_id: { type: :integer },
            location_id: { type: :integer }
          },
          required: %w[header text_content]
        },
        tag: {
          type: 'object',
          properties: {
            name: { type: :string }
          },
          required: [ 'name' ]
        },
        vote: {
          type: 'object',
          properties: {
            is_up_vote: { type: :boolean },
            question_id: { type: :integer }
          }
        }
      },
      components: {
        securitySchemes: {
            bearerAuth: {
              type: :http,
              scheme: :bearer,
              bearerFormat: :JWT,
              name: :Authorization,
              in: :header
            },
        }
      },
      security: [
        { bearerAuth: [] }
      ],
      paths: {},
      servers: [
        { url: 'https://wizeline-questions-qa.herokuapp.com' },
        { url: ENV.fetch('RAILS_URL', 'http://localhost:3000') }
      ]
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end
