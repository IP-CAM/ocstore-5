<?php
        $this->load->model('user/user_group');

        $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'newsblog/category');
        $this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'newsblog/category');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'newsblog/article');
        $this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'newsblog/article');
        $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'extension/module/newsblog_articles');
        $this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'extension/module/newsblog_articles');
?>