<script>
	function profile_store_init(obj,ety={})
	{
		var ProfileActions = flux.createActions(['changeSourceType']);
		var ProfileStore = flux.createStore({
		data: obj,
		entity: ety,
		actions: [
			ProfileActions.changeSourceType,
			],
			changeSourceType: function(source_type)
			{
				this.data.source_type = source_type;
				this.emit('source_type.change');
			},
			exports: {
				getAttribute: function(attr){
					return this.data[attr];
				}
			}

		});
	}
</script>