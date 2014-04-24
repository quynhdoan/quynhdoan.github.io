require "redcarpet"
###
# Compass
###

compass_config do |config|
  # Require any additional compass plugins here.
  config.add_import_path "bower_components/foundation/scss"

  # Set this to the root of your project when deployed:
  config.http_path = "/"
  config.css_dir = "stylesheets"
  config.sass_dir = "stylesheets"
  config.images_dir = "images"
  config.javascripts_dir = "javascripts"

  # You can select your preferred output style here (can be overridden via the command line):
  # output_style = :expanded or :nested or :compact or :compressed

  # To enable relative paths to assets via compass helper functions. Uncomment:
  # relative_assets = true

  # To disable debugging comments that display the original location of your selectors. Uncomment:
  # line_comments = false


  # If you prefer the indented syntax, you might want to regenerate this
  # project again passing --syntax sass, or you can uncomment this:
  # preferred_syntax = :sass
  # and then run:
  # sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass

end

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
## Site-wide settings
####

set :full_name, "Quynh Doan"
set :city, "Southern California"
set :email, "quynhddoan@gmail.com"
# set :resume, nil
# set :google_analytics_tracking_id, "UA-111111111-11"

# TODO: use either the profile name or the url
set :linkedin_profile_name, "quynh-doan"
set :linkedin_url, "//linkedin.com/pub/quynh-doan/49/8b6/599"
set :github_username, "quynhdoan"
set :github_url, "//github.com/quynhdoan"
set :stackoverflow_username, "quinn"
set :stackoverflow_url, "//stackoverflow.com/users/3298432/quinn"
set :blog_url, "//medium.com/@qddoan"
# set :gravatar_email_address, "me@adalovelace.com"
set :goodreads_url, "//goodreads.com/user/show/30809475-quynh-doan"
Time.zone = "America/Chicago"

###
## Blog settings
###

# set :disqus_shortname, "adas-blog"

# activate :blog do |blog|
#   blog.prefix = "/blog"
#   blog.permalink = ":title.html"
#   blog.sources = "/blog/:year-:month-:day-:title.html"
#   #blog.taglink = "tags/:tag.html"
#   #blog.layout = "article"
#   #blog.summary_separator = /(READMORE)/
#   #blog.summary_length = 250
#   #blog.year_link = ":year.html"
#   #blog.month_link = ":year/:month.html"
#   #blog.day_link = ":year/:month/:day.html"
#   #blog.default_extension = ".md"

#   #blog.tag_template = "/blog/tag.haml"
#   #blog.calendar_template = "/blog/calendar.haml"

#   #blog.paginate = true
#   #blog.per_page = 5
#   #blog.page_link = "page/:num"
# end

#page "/blog/feed.xml", :layout => false
#page "/index.haml", layout: :layout
#page "/posts/*", layout: :post

# Borrow from techpeace/personal-site-template
# Modified to work with Font Awesome 4
helpers do
  # Generate the markup for a responsive social network link.
  #
  # network_name    - The String name of the social network, e.g. "Facebook".
  # network_setting - The String variable set in this config file for the network,
  #                   e.g. facebook_profile_name.
  # url             - The String URL for the link.
  #
  # Returns the String markup.
  def social_network_link(network_name, network_setting, url)
    if network_setting
      <<-MARKUP
        <li>
          <a class="button" href='#{url}' target="_blank">
            <span class='hide-for-small'><i class='fa fa-#{network_name.downcase.gsub(' ', '-')} fa-lg'></i>
            </span><span class='show-for-small'>#{network_name}</span>
          </a>
        </li>
      MARKUP
    end
  end

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(gravatar_id, options = {size: 50})
    gravatar_id = Digest::MD5::hexdigest(email)
    size = options[:size]
    gravatar_url =  "http://gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: full_name, class: "gravatar")
    end
end

set :haml, format: :html5
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true, footnotes: true, autolink: true

###
# Deployment settings
###

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Add bower's directory to sprockets asset path
after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

activate :livereload
activate :directory_indexes

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
