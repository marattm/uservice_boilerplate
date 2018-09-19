import React, { Component } from 'react';

class About extends Component {

    componentDidMount() {
        this.props.health();
    }

    render() {
        return (
            <div>
                <button 
                    className="btn btn-info btn-lg"
                    onClick={(event) => this.props.health(event)}
                >
                    Check Health!
                </button>
                <br /><br />
                <p>{this.props.healthData.status}</p>
                <p>{this.props.healthData.message}</p>
            </div>
        )
    };
}




export default About;