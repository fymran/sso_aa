from flask import session, Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

product_bp = Blueprint('product', __name__)

@product_bp.before_request
def restrict_to_admin():
    if 'admin' not in session:
        flash('Please log in to access the admin panel.')
        return redirect(url_for('login'))

# Helper functions
def execute_query(query, args=None, fetch=False):
    """Executes a given SQL query and optionally fetches data."""
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(query, args or ())
    result = cursor.fetchall() if fetch else None
    conn.commit()
    cursor.close()
    conn.close()
    return result

# View all product entries
@product_bp.route('/product')
def product():
    product = execute_query('SELECT productID, productName FROM PRODUCT', fetch=True)
    return render_template('admin/product.html', product=product)

# Add a new member
@product_bp.route('/add_product', methods=['GET', 'POST'])
def add_product():
    if request.method == 'POST':
        productName = request.form['productName']
        execute_query('INSERT INTO PRODUCT (productName) VALUES (%s)', (productName,))
        flash('New product added successfully!')
        return redirect(url_for('product.product'))
    
    return render_template('admin/add_product.html')

# Edit product
@product_bp.route('/edit_product/<int:productID>', methods=['GET', 'POST'])
def edit_product(productID):
    if request.method == 'POST':
        product = (request.form['productName'], productID)
        execute_query('UPDATE product SET productName = %s WHERE productID = %s', product)
        flash('Product updated successfully!')
        return redirect(url_for('product.product'))

    product = execute_query('SELECT productID, productName FROM product WHERE productID = %s', (productID,), fetch=True)
    if product:
        return render_template('admin/edit_product.html', product=product[0])
    else:
        flash('Product not found.')
        return redirect(url_for('product.product'))

# Delete product
@product_bp.route('/delete_product/<int:productID>', methods=['POST'])
def delete_product(productID):
    execute_query('DELETE FROM product WHERE productID = %s', (productID,))
    flash('Product deleted successfully!')
    return redirect(url_for('product.product'))
