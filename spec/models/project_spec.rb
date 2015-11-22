require 'spec_helper'

describe Project do
  let(:project) do
    Project.new(name: 'project',
                description: 'a project description',
                image_path: '/images/an_image.png',
                website_url: 'https://awebsite.com',
                github_url: 'https://github.com/project')
  end

  describe '#name' do
    it 'exists' do
      unnamed_project = project
      unnamed_project.name = ''

      expect(unnamed_project).not_to be_valid
    end

    it 'is unique' do
      project.save
      repeated_project = Project.new(name: 'project',
                                     description: 'different description',
                                     image_path: 'different_image.jpg',
                                     website_url: 'differentwebsite.com',
                                     github_url: 'github.com/differenturl')

      expect(repeated_project).not_to be_valid
    end
  end

  describe '#description' do
    it 'exists' do
      indescribeable_project = project
      indescribeable_project.description = ''

      expect(indescribeable_project).not_to be_valid
    end
  end

  describe '#github_url' do
    it 'exists' do
      closed_source_project = project
      closed_source_project.github_url = ''

      expect(closed_source_project).not_to be_valid
    end
  end
end
