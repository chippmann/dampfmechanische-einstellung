extends Node
# set through autoload
#class_name PlayerNavigationTarget


signal new_player_navigation_target(target, action_instance_guid)
signal player_navigation_finished(action_instance_guid)
signal player_navigation_cancelled(action_instance_guid)
