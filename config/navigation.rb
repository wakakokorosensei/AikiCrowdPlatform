# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.renderer = SimpleNavigation::Renderer::Bootstrap
  navigation.autogenerate_item_ids = false

  navigation.items do |primary|
    primary.dom_class = 'nav nav-tabs'

    primary.item :projects, 'Project', project_path(@project)
    primary.item :comment, 'Comments', new_project_comment_path(@project)

  end

end
