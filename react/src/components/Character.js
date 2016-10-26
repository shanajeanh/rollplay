class Characters extends Component {
  constructor(props) {
    super(props);
    this.state = {
      id: '',
      skills: [],
      ranks: [],
      feats: []
    };
  }

  componentDidMount() {
    $.ajax({
      url: '/api/v1/characters',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({
        id: data.id,
        ranks: data.ranks,
        feats: data.feats
        });
    });
  }

  render() {
    return (
      <div class="specials">
        
      </div>
    );
  }
}

export default Skills;
