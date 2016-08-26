var SourceSettingsForm = React.createClass({
  getInitialState: function () {
    return {
      name: ProfileStore.getAttribute('name') 
    };
  },
  componentWillMount: function () {
    ProfileStore.on('source_type.change', this.onChange);
  },
  componentWillUnmount: function () {
    ProfileStore.off('source_type.change', this.onChange);
  },
  componentDidMount: function () {
  },
  sourceTypeChange: function(){
  },
  sourceTypeOnChange: function(){
    this.setState({
      source_type: ProfileStore.getSourceType()
    });
  },
  render: function(){
    return (
      <div>
        ABC
      </div>
    );
  }
})