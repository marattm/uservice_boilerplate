# services/users/project/api/users.py

from flask import Blueprint, jsonify, request, render_template
# from sqlalchemy import exc
# from project.api.models import User
# from project import db


users_blueprint = Blueprint('users', __name__, template_folder='./templates')


@users_blueprint.route('/', methods=['GET', 'POST'])
def index():
    '''
    return the default home page
    '''
    return render_template('index.html')


@users_blueprint.route('/api/v0/users/health', methods=['GET'])
def health():
    '''
    return a JSON, with a healthy message
    '''
    return jsonify({
        'status': 'success',
        'message': 'Users service healthy!'
    })
