FactoryGirl.define do
  factory :raml_repository, class: Repository do
    name "public-repo"
    github_id "35129377"
    owner "baxterthehacker"
  end
end
