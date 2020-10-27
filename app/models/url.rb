class Url < ApplicationRecord

  validates :source, presence: true

  after_create do |url|
    url.key = generate_key(url.id)
    url.save
  end

  def generate_key(i)
    # this code was extracted from http://refactormycode.com/codes/125-base-62-encoding
    # with only minor modification
    alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)
    return alphabet[0] if i == 0
    s = ''
    base = alphabet.length
    while i > 0
      s << alphabet[i.modulo(base)]
      i /= base
    end
    s.reverse
  end
end
