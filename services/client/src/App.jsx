import React, { Component } from 'react';
import axios from 'axios';
import { Switch, Route } from 'react-router-dom'


import About from './components/About';
import NavBar from './components/NavBar';


class App extends Component {
    constructor() {
        super();
        this.state = {
            users: [],
            username: '',
            email: '',
            active: '',
            admin:'',
            title: 'uServices',
            formData: {
                username: '', 
                email: '', 
                password: ''
            },
            isAuthenticated: false,
            healthData: {
                message:'click on the button',
                status:'waiting for a message..'
            }
        };
        this.health = this.health.bind(this);

    };

    componentDidMount() {
        // this.health();
        console.log(`${process.env.REACT_APP_USERS_SERVICE_URL}`);
        console.log(`${process.env.REACT_APP_TRAINERS_SERVICE_URL}`);
    };


    health() {
        axios.get(`${process.env.REACT_APP_USERS_SERVICE_URL}/api/v0/users/health`)
            .then((res) => {
                if (this.state.healthData.status === "success") {
                   this.setState({
                       healthData: {
                           message: 'click on the button',
                           status: 'waiting for a message..'
                       }
                   })
               } else {
                   this.setState({
                       healthData: {
                           message: res.data.message,
                           status: res.data.status
                       }
                   })
               }
            })
            .catch((err) => { console.log(err); });
    };


    render() {
        return (
            <div>
                <NavBar
                    title={this.state.title}
                    isAuthenticated={this.state.isAuthenticated}
                />
                <div className="container"> 
                    <div className="row">
                        <div className="col-md-6"> <br />
                            <Switch>



                                <Route exact path='/' render={() => (
                                    <div>
                                        <h1>Welcome</h1> <hr /><br />
                                    </div>
                                )} />

                                <Route
                                    exact path='/about' render={() => (
                                        <About 
                                            healthData={this.state.healthData}
                                            health={this.health}
                                        />
                                    )}
                                />



                            </Switch>
                        </div>
                    </div>
                </div>
            </div>
        )
    };
};

export default App;