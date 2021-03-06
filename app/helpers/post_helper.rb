module PostHelper
  def display_errors(post)
    return unless post.errors.full_messages.any?

    content_tag :p, "Post could not be saved. #{post.errors.full_messages.join('. ')}", class: 'errors'
  end

  def if_friend(lol, lists)
    render lol if lists.include?(lol.user_id) || lol.user_id == current_user.id
  end
end
