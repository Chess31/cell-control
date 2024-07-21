if (instance_exists(parent_id)) {
	var _core_branch_array = parent_id.available_branches;
	_core_branch_array[branch_index][1] = true;
	parent_id.branches--;
}