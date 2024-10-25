from flask import Blueprint, render_template, redirect, url_for

public_bp = Blueprint('public', __name__)

@public_bp.route('/')
def public_main_menu():
    return render_template('public/public_main_menu.html')
