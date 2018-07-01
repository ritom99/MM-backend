<?php 

defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends CI_Controller {
	public function echo_json($response) {
		$data['json_response'] = json_encode($response);
		$this->load->view('api/api',$data);
	}

	public function getfeaturedposts() {
		$featuredposts = $this->post_model->get_featured_posts();
		$this->echo_json($featuredposts);
	}

	public function getposts() {
		$posts = $this->post_model->get_posts();
		$this->echo_json($posts);
	}

	public function gettabposts($tab) {
		$tabposts = $this->post_model->get_tab_posts($tab);
		$this->echo_json($tabposts);
	}
}

?>
