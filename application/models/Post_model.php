<?php

class Post_model extends CI_Model {

	public function __construct() {
		$this->load->database();
	}

	public function get_posts($slug = FALSE) {
		if($slug == FALSE) {
			$query = $this->db->query("SELECT * FROM posts ORDER BY date DESC;");
			return $query->result_array();
		}

		$views = $this->db->query("UPDATE posts SET views = views + 1 WHERE slug='$slug';");
		$query = $this->db->get_where('posts', array('slug' => $slug));
		return $query->row_array();
	}

	public function get_editors_picks() {
		$query = $this->db->query('SELECT * FROM posts ORDER BY views DESC LIMIT 3;');
		return $query->result_array();
	}

	public function get_featured_posts() {
		$query = $this->db->query('SELECT * FROM posts WHERE featured=1 ORDER BY date DESC LIMIT 2;');
		return $query->result_array();
	}

	public function get_tab_posts($tab) {
		if ($tab != 'pictures') {
			$query = $this->db->query("SELECT * FROM posts WHERE category='$tab' ORDER BY date desc; ");
			return $query->result_array();
		}
		$query = $this->db->query("SELECT * FROM pictures ORDER BY date desc; ");
		return $query->result_array();
	}

	public function get_pictures() {
		$query = $this->db->query('SELECT * FROM pictures ORDER BY date DESC LIMIT 6;');
		return $query->result_array();
	}

	public function get_latest_posts($category = FALSE, $mostrecent = FALSE) {
		if ($category == FALSE) {
			$query = $this->db->query("SELECT * FROM posts ORDER BY date DESC LIMIT 3;");
			return $query->result_array();
		} 

		if ($category != FALSE and $mostrecent == TRUE) {
			$query = $this->db->query("SELECT * FROM posts WHERE category='$category' ORDER BY date DESC LIMIT 1;");
			return $query->row_array();
		}

		$query = $this->db->query("SELECT * FROM posts WHERE category='$category' ORDER BY date DESC LIMIT 1,5;");
		return $query->result_array();
	}

	public function add_posts($title, $category, $slug, $image, $info, $date, $author, $body) {
		
		$query = $this->db->query("INSERT INTO posts (title, category, slug, image, info, date, author, body, views) values ('$title', '$category', '$slug', '$image', '$info', '$date', '$author', '$body', 0); ");

	}

	public function delete_post($id) {
		$query = $this->db->query("DELETE FROM posts WHERE id='$id';");
	}

	public function delete_pic($id) {
		$query = $this->db->query("DELETE FROM pictures WHERE id='$id';");
	}

	public function get_post($id) {
		$query = $this->db->query("SELECT * FROM posts WHERE id='$id';");
		return $query->row_array();
	}

	public function edit_post($id, $title, $category, $slug, $image, $info, $date, $author, $body) {

		$query = $this->db->query("UPDATE posts SET title='$title', category='$category', slug='$slug', image='$image', info='$info', date='$date', author='$author', body='$body' WHERE id=$id; ");

	}

	public function add_pics($title, $image, $info, $date) {
		
		$query = $this->db->query("INSERT INTO pictures (title, image, info, date) values ('$title', '$image', '$info', '$date'); ");

	}

}

?>