xml.instruct!

xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  
  # Home Page
  xml.url do
    xml.loc         root_url
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  "always"
  end
  
  # Recommendations
  xml.url do
    xml.loc         recommendations_url
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  "weekly"
  end
  
  # Projects
  xml.url do
    xml.loc         projects_url
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  "weekly"
  end
  for project in @projects
    xml.url do
      xml.loc         project_url(project)
      xml.lastmod     w3c_date(project.updated_at)
      xml.changefreq  "weekly"
      xml.priority    0.9
    end
  end
  
end