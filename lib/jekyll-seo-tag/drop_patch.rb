# frozen_string_literal: true

module DropPatch
  def canonical_url
    @canonical_url ||= begin
      if page["canonical_url"].to_s.empty?
        url = filters.absolute_url(page["url"]).to_s.gsub(%r!/index\.html$!, "/")
        return url unless url && url[-5..] == ".html"
        url.gsub("\.html", "")
      else
        page["canonical_url"]
      end
    end
  end
end

class Jekyll::SeoTag::Drop # rubocop:disable Style/ClassAndModuleChildren
  prepend DropPatch
end
