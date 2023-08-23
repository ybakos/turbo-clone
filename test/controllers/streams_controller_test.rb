require 'test_helper'

class TurboClone::StreamsControllerTest < ActionDispatch::IntegrationTest

  test 'create with respond to' do
    post articles_path, params: { article: { content: 'fake' } }
    assert_redirected_to articles_path
    post articles_path, params: { article: { content: 'fake' } }, as: :turbo_stream
    assert_turbo_stream action: 'prepend', target: 'articles'
  end

  test 'update with respond to' do
    article = Article.create!(content: 'fake')
    patch article_path(article), params: { article: { content: 'new content' } }
    assert_redirected_to articles_path
  end

  test 'destroy with respond to' do
    article = Article.create!(content: 'fake')
    delete article_path(article)
    assert_redirected_to articles_path
  end

end