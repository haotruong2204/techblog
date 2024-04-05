# frozen_string_literal: true

module ApplicationHelper
  require "nokogiri"

  include Pagy::Frontend

  FLASH_TYPE = {
    success: "success", error: "error", failed: "failed",
    alert: "error", notice: "success", danger: "danger"
  }.freeze

  def flash_class flash_type
    FLASH_TYPE[flash_type] || flash_type.to_s
  end

  def active_sidebar path, controller
    "active" if current_page?(path) || controller_name == controller
  end

  def format_date date
    date.strftime(Settings.time.formats)
  end

  def extract_image_urls_from_content content
    doc = Nokogiri::HTML(content)
    doc.css("img").map { |img| img["src"] }
  end
end
