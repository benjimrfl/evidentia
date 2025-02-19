#!/bin/bash
git submodule update --init --recursive
cp Homestead.yaml homestead/Homestead.yaml
cd homestead
git pull origin main
vagrant box remove laravel/homestead --all
vagrant box add laravel/homestead -c
vagrant up
vagrant ssh -c 'cd evidentia; composer install; npm install; npx mix; php artisan evidentia:start vagrant; php artisan evidentia:instance'

echo ""
echo "WELCOME TO"
echo ".########.##.....##.####.########..########.##....##.########.####....###...";
echo ".##.......##.....##..##..##.....##.##.......###...##....##.....##....##.##..";
echo ".##.......##.....##..##..##.....##.##.......####..##....##.....##...##...##.";
echo ".######...##.....##..##..##.....##.######...##.##.##....##.....##..##.....##";
echo ".##........##...##...##..##.....##.##.......##..####....##.....##..#########";
echo ".##.........##.##....##..##.....##.##.......##...###....##.....##..##.....##";
echo ".########....###....####.########..########.##....##....##....####.##.....##";
echo ""

echo "Open in a new browser:"
echo "http://192.168.10.10"

echo ""
echo "The installation has been completed successfully. Enjoy!"
