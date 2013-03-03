require 'formula'

class GitTodo < Formula
  homepage 'http://github.com/johnliu/git-todo'
  url 'http://github.com/johnliu/git-todo.git', :tag => '0.1'
  version '0.1'

  head 'http://github.com/johnliu/git-todo.git'

  depends_on 'ack' => :recommended

  def install
    bin.install 'git-todo'
    bin.install 'git-todos'
  end

  def test
    system "#{bin}/git-todo"
    system "#{bin}/git-todos"
    system 'git todo'
    system 'git todos'
  end
end
