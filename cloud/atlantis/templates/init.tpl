#cloud-config
users:
  - name: rmartev
    groups: sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh-authorized-keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQCVgHQG8m56QX4p2NijLqbZc3A0kwB/8UFJdCHYVDJmwUHu3zKlk3FSnXi4JEueRi5gpwWThdqBj8yrhua+qWXAxfO8JVXcz8tTZ7AHGsviX+7xEhRbjaHctQ1bsTCL0XtzmuINMZHf1ruMrdKVfXaeKzqJgA2KEwfXvYWTiIU8aluR9mE5aBI9E5EIgTDhkGFrH2CRQ709RM5H2KQfVR4bKUc2S/ZtMmpnyxeoRcspWBsIMMQE50LIvMSYrxR4WR5j+qXxqgUq7m2hHuojOwUCxxOe/JbvB5gF6UwIiigdLe1D6cisdwDu22vmzzj02d3ArEeo1d2S5AWeEls5XQgNr3UawSjm4lbAtztGmeu6qvxLKCQz9kmKRcGTRCyNgPInkylyczgSRQ8fb/MyNFzz70KmklFpInKw6slVa5wEEoC3Q9SjbKirGapFIrzS4wF/vTipsZ/3Ivk5LtrhCLtXpB+MBma/N/s79Olclgut82fHGDzoIfEpjMgTP6hH3CT/igC8nt5xCMir4VNQhEiQXtzI2Wy9SoFfoXfvvvsRmIPDq4pbCC5oczaaPo1ghex1FV/NIn+VcMiqv77W01FKmWg4cuRrtUOwy+WUHv48qLAF/a/1zVJqhPCBY31A9iwc8iTtqzKjXyA3qs5PGyde0KuY6CPwbUpNyWRPHJ+dwyOgr9DfiJCsxvEgJ879b5MhCpsAvSY5Vs7LEaJWFKEl0EYxqPRmhZuwp9b0rXVVb6+HEjqQciP58gfHHYyDHPUIegmUtsSQivPlxhosvmCPBoZFRyAjk1qlES2wYlvYBG6tgP+TTwiaW2djrisvprXApxjSruaf7NtktNQyZGjzXWtmDsSeoOBl2ZkdVmACsAvzOkorb/VB2+AdNBJvnBiotvrqPhL31AAp63YDEjGdB6+MZ8LSBExd8IeuF42iQty6Fj3KO91lJhzpWYMH8u40+tvLG3JeLAHKM/eiFWStq9n9AQ6kcERhGXoeAX/e9OvpBM6KQuH1Ud/uHFlbHrdKrh6zLJyRiWQgqBCa52xFmzKIkC2LSKH2EsZDeP04C+2z46Gzb5GkCDu497nkdihNH5L81lGdp817Fem8FthI6wXmlGgez05Sq/SQdWY9tHhX49qDVPHRIyWbXWzbaabQ0DklpLq8tub5vRn+mVkREMa+CQ+/N2SqXo26b/fIZKSoeDLNrHK/w4BQVVwyTMlOU0QuDaBj6hiqGefMP0u5jskrO+R6+tYuJfhJMsaVuZ78aw4VWDLgRQOuZ3RRj1H5uiYyp7mTXPr5hOsHziOwXQbqt3P3zEShuWc1oh0hWCk2wgoSY/VzsOZz82OD9NnuVVzaAUxDBu3c/cA0Lu+7
  - name: etsimerman
    groups: sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh-authorized-keys:
      - ssh-rsa <undefined>