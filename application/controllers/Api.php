<?php 

defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends CI_Controller {
	public function getfeaturedposts() {
		$data['featuredposts'] = $this->post_model->get_featured_posts();
		
	}
}

?>
