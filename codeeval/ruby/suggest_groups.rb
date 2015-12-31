# SUGGEST GROUPS
#
# Given lines of user, friends and groups each, recommend to users new groups
# where at least 50% of their friends are members.

# The users of each group
group_members = Hash.new{|h, k| h[k] = [] }

# The friends of each user
user_friends = {}

IO.foreach(ARGV[0]) do |line|
  user, friends, groups = line.strip.split(":")
  user_friends[user] = friends.split(",")

  groups.split(",").each do |group|
    group_members[group] << user
  end unless groups.nil?
end

# How many user has in a given group
recommendations = Hash.new{|h, k| h[k] = [] }
group_members.each do |group, members|
  user_friends.each do |user, friends|
    # We don't want to recommend joining a group they are already in
    next if group_members[group].include?(user)

    friends_in_group = friends.count{|friend| members.include?(friend) }
    recommendations[user] << group if friends_in_group >= 0.5 * user_friends[user].size
  end
end

recommendations.keys.sort.each do |user|
  puts "#{user}:#{recommendations[user].sort.join(",")}"
end
