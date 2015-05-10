FactoryGirl.define do
  factory :commit do
    sha "0d1a26e67d8f5eaf1f6ba5c57fc3c7d91ac0fd1c"
    message "Update README.md"
    timestamp "2015-05-05T19:40:15-04:00"
    url "https://github.com/baxterthehacker/public-repo/commit/0d1a26e67d8f5eaf1f6ba5c57fc3c7d91ac0fd1c"
    association :repository, factory: :raml_repository
  end
end
