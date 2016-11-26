require 'json'

module ShowImageHelper
  def pretty_json(hash)
    JSON.pretty_generate(hash)
  end
end
