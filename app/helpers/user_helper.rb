module UserHelper
  def received_request(friend)
    if current_user.friend_requests.any?
      friend.each do |user|
        next if current_user.friend?(user)

        concat content_tag(:li, "#{user.name} Want to be your friend") +
               (link_to 'Accept ', user_friendship_path(@friend_requests, user),
                        method: :put, style: 'color: #008000;') +
               (link_to 'Reject', user_friendship_path(@friend_requests, user),
                        method: :delete, style: 'color: #FF0000;')
      end
    else
      concat content_tag(:p, "You didn't received any friend request yet.")
    end
  end

  def sent_requests(pending_requests)
    pending_requests.each do |req|
      concat content_tag(:li, "Waiting friend confirmation from  #{req.name}") unless current_user.friend?(req)
    end
  end

  def if_include(lists)
      if (lists.include? params[:id].to_i) || (current_user.id == params[:id].to_i)
        @posts.each do |lol|
          render lol
        end
      end
  end
end
