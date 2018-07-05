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

	public function get_forum_posts($id) {
		if ($id != NULL) {
			$query = $this->db->query("SELECT * FROM forumposts WHERE post_id='$id' ORDER BY date DESC; ");
			return $query->row_array();
		}

		$query = $this->db->query("SELECT * FROM forumposts ORDER BY date DESC; ");
		return $query->result_array();
	}

	public function get_forum_thread($id) {
		if ($id == NULL) {
			$query = $this->db->query("SELECT * FROM forumthread ORDER BY date desc; ");
			return $query->result_array();
		}
		$query = $this->db->query("SELECT * FROM forumthread WHERE post_id='$id' ORDER BY date desc; ");
		return $query->result_array();
	}

	public function add_forum_post($user, $title, $content) {
		$slug = url_title($title);
		$query = $this->db->query("INSERT INTO forumposts (slug, created_by, title, post) values ('$slug', '$user', '$title', '$content'); ");
	}

	public function add_forum_comment($id, $user, $comment) {
		$query = $this->db->query("INSERT INTO forumthread (post_id, user, body) VALUES ('$id', '$user', '$comment'); ");
	}

	public function delete_forum_post($id) {
		$query = $this->db->query("DELETE FROM forumposts WHERE post_id='$id';");
	}

	public function get_comments($status = 'approved', $id = NULL) {
		if ($id != NULL and $status == 'approved') {
			$query = $this->db->query("SELECT * FROM comments WHERE post_id='$id' AND status='approved' ORDER BY date DESC; ");
			return $query->result_array();
		}
		elseif ($id == NULL and $status == 'approved' ) {
			$query = $this->db->query("SELECT * FROM comments WHERE status='approved' ORDER BY date DESC; ");
			return $query->result_array();
		}
		elseif ($id == NULL and $status == 'notapproved') {
			$query = $this->db->query("SELECT * FROM comments WHERE status='notapproved' ORDER BY date DESC; ");
			return $query->result_array();
		}
	}

	public function add_comment($id, $user, $comment) {
		$query = $this->db->query("INSERT INTO comments (post_id, user, content) VALUES ('$id', '$user', '$comment'); ");
	}

	public function approve_comment($id) {
		$query = $this->db->query("UPDATE comments SET status='approved' WHERE comment_id='$id'; ");
	}

}

?>