module SwatchPopulator
  extend ActiveSupport::Concern

  SWATCH_OPTIONS = %w(pink green blue dark-blue violet orange yellow dark-green black)

  included do |klass|
    klass.before_save :populate_dummy_swatch
  end

  private

  def populate_dummy_swatch
    self.dummy_swatch_color ||= SWATCH_OPTIONS.sample
  end
end
