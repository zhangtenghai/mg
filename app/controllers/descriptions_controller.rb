class DescriptionsController < ApplicationController
  def team
    @description = Description.find_by_title("编辑团队")
    render "show"
  end

  def suggestion
    @description = Description.find_by_title("建议和BUG汇报")
    render "show"
  end

  def submission
    @description = Description.find_by_title("投稿须知")
    render "show"
  end

  def term
    @description = Description.find_by_title("法律条款")
    render "show"
  end

  def disclaimer
    @description = Description.find_by_title("免责声明")
    render "show"
  end

  def cooperation
    @description = Description.find_by_title("合作洽谈")
    render "show"
  end
end
