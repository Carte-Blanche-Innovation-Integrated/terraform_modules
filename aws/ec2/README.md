# AWS/EC2

A simple terraform module which creates a single EC2 instance.

It also gives u the ability to create and attach:

- Key pair
- One or more EBS volumes

## Args

- instance_name (string)
  - Name of the ec2 instance.
- iam_role_name (string)
  - Name of the iam role, needed to create an instance profile for ec2.
- should_create_keypair (bool)
  - Should a new key pair be created for the ec2 instance?
- key_pair_name (string)
  - Name of the key pair. If 'should_create_keypair' is true then this string is used as the new key name. If it is false then this key pair is considered to be created already.
- ebs_vols (list[number])
  - List that contains the size of one or more EBS volumes
  - Can't attach more than 11 volumes with an instance.
- instance_type (string)
  - Family of the instance
- user_data_file_path (string)
  - Path of the file in which user data is stored.
- subnet_id (string)
  - ID of the subnet you want to place the instance inside.
- enable_monitoring (bool)
  - Should the detailed monitoring for this instance be enabled?
- associate_public_ip (bool)
  - Should a public ip address be attached with the instance?
- sgs (list[string])
  - List of SG ids for EC2 instance.
- instance_termination_protection (bool)
  - Should instance deletion protection be enabled?
