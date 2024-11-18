resource "aws_launch_template" "my_launch_template" {
    name = "my_launch_template"
    description = "My launch template"
    image_id = data.aws_ami.amzlinux2.id
    instance_type = var.instance_type
    
    vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
    key_name = var.instance_keypair

    user_data = filebase64("${path.module}/app1-install.sh")
    ebs_optimized = true
    update_default_version = true

    block_device_mappings {
        device_name = "/dev/sda1"
        ebs {
            volume_size = 20
            volume_type = "gp2"
            delete_on_termination = true
        }
    }
    monitoring {
        enabled = true
    }
    tag_specifications {
        resource_type = "instance"
        tags = {
            Name = "myasg"
        }
    }
}