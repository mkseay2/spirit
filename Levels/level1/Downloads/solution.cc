#include "util.h"
#include <queue>
#include <tuple>
#include <map>
#include <vector>
#include <iostream>
#include <algorithm>
#include <stdlib.h>

bool sortBySec(const std::pair< std::pair< std::pair<User, Vector3>, float>, std::pair<bool, Color>> &a, 
               const std::pair<std::pair<std::pair<User, Vector3>, float>, std::pair<bool, Color>> &b) {
    // sort by angle from satellite
    return (abs(a.first.second) < abs(b.first.second));
}

bool sortBySecLen(const std::pair< std::pair<Sat, Vector3>, std::vector<std::pair<std::pair<std::pair<User, Vector3>, float>, std::pair<bool, Color>>>> &a,
                  const std::pair< std::pair<Sat, Vector3>, std::vector<std::pair<std::pair<std::pair<User, Vector3>, float>, std::pair<bool, Color>>>> &b) {
    // sort by number of users the satellite can cover
    size_t len_a = a.second.size();
    size_t len_b = b.second.size();
    return (len_a < len_b);
}

std::map<User, std::pair<Sat, Color>> solve(
    const std::map<User, Vector3>& users,
    const std::map<Sat, Vector3>& sats) 
{
    std::map<User, std::pair<Sat, Color>> solution;

    // vector holds ((Sat, sat_vec), vector of possible users for that satellite)
    std::vector<std::pair< std::pair<Sat, Vector3>, std::vector<std::pair<std::pair<std::pair<User, Vector3>, float>, std::pair<bool, Color>>>>> satellites;
    int count_users_not_added = users.size();

    // add all satellites to the vector satellites
    std::map<Sat, Vector3>::const_iterator cur_sat = sats.begin();
    while (cur_sat != sats.end()) {
        Vector3 sat_vec = cur_sat->second;

        // stores ( (User, user_vec), angle), (true if used/false if not used for current satellite, color) )
        std::vector<std::pair<std::pair<std::pair<User, Vector3>, float>, std::pair<bool, Color>>> possible_users;

        // add all users that can be assigned to the current satellite
        std::map<User, Vector3>::const_iterator cur_user = users.begin();
        while (cur_user != users.end()) {
            Vector3 user_vec = cur_user->second;

            Vector3 user_vertical;
            user_vertical.x = user_vec.x * 3;
            user_vertical.y = user_vec.y * 3;
            user_vertical.z = user_vec.z * 3;

            float angle = user_vec.angle_between(sat_vec, user_vertical);

            // check if user is within range of satellite and if the user has already been placed
            if ((angle <= 45) && (solution.count(cur_user->first) <= 0)) {
                // possible for satellite to service this user
                std::pair<User, Vector3> user_info(cur_user->first, cur_user->second);

                // ((User, user_vec), angle)
                std::pair<std::pair<User, Vector3>, float> user_info_other(user_info, angle);
                std::pair<bool, Color> color_info(false, -1);

                // ( (User, user_vec), angle), (true if used/false if not used for current satellite, color) )
                std::pair<std::pair<std::pair<User, Vector3>, float>, std::pair<bool, Color>> add_user(user_info_other, color_info);

                possible_users.push_back(add_user);
            }

            cur_user++;
        }

        // sort vector of possible users for this current satellite based on the angle the user is from the satellite
        sort(possible_users.begin(), possible_users.end(), sortBySec);

        std::pair<Sat, Vector3> sat_p(cur_sat->first, sat_vec);
        // ((Sat, sat_vec), vector of possible users for that satellite)
        std::pair< std::pair<Sat, Vector3>, std::vector<std::pair<std::pair<std::pair<User, Vector3>, float>, std::pair<bool, Color>>>> satellites_p(sat_p, possible_users);
        satellites.push_back(satellites_p);

        cur_sat++;
    }

    sort(satellites.begin(), satellites.end(), sortBySecLen);

    // color the possible users for each satellite
    for (size_t s = 0; s < satellites.size(); s++) {
        // ( (User, user_vec), angle), (true if used/false if not used for current satellite, color) )
        std::vector<std::pair<std::pair<std::pair<User, Vector3>, float>, std::pair<bool, Color>>> possible_users = satellites[s].second;
        Sat cur_sat = satellites[s].first.first;
        Vector3 sat_vec = satellites[s].first.second;

        size_t count_users = 0;

        // loop through all the possible users for the current satellite
        for (size_t i = 0; (i < possible_users.size()) && (count_users < 32); i++) {
            // ( (User, user_vec), angle), (true if used/false if not used for current satellite, color) )
            std::pair<std::pair<std::pair<User, Vector3>, float>, std::pair<bool, Color>> current_user = possible_users[i];
            std::pair<User, Vector3> user_info = current_user.first.first;
            std::pair<bool, Color> color_info = current_user.second;

            User user = user_info.first;
            Vector3 user_vec = user_info.second;

            bool color_a = false;
            bool color_b = false;
            bool color_c = false;
            bool color_d = false;

            for (int j = 0; j < possible_users.size(); j++) {
                // user is being used for current satellite
                if (possible_users[j].second.first == true && (user != possible_users[j].first.first.first)) {
                    // check the angle between the current user and the other possible user for this satellite
                    if (sat_vec.angle_between(user_vec, possible_users[j].first.first.second) < 10) {
                        if (possible_users[j].second.second == colors[0]) {
                            color_a = true;
                        } else if (possible_users[j].second.second == colors[1]) {
                            color_b = true;
                        } else if (possible_users[j].second.second == colors[2]) {
                            color_c = true;
                        } else {
                            // possible_users[j].second.second == colors[3]
                            color_d = true;
                        }
                    }
                }
            }

            // check if user can be inserted based on previous possible users and their colors
            if (color_a == false) {
                // can use color_a for current user
                std::pair<Sat, Color> user_sat(cur_sat, colors[0]);
                solution.insert({user_info.first, user_sat});
                count_users++;

                // set that the user has been assigned to this current satellite and given color a
                possible_users[i].second.first = true;
                possible_users[i].second.second = colors[0];
            } else if (color_b == false) {
                // can use color_b for current user
                std::pair<Sat, Color> user_sat(cur_sat, colors[1]);
                solution.insert({user_info.first, user_sat});
                count_users++;

                // set that the user has been assigned to this current satellite and given color b
                possible_users[i].second.first = true;
                possible_users[i].second.second = colors[1];
            } else if (color_c == false) {
                // can use color_c for current user
                std::pair<Sat, Color> user_sat(cur_sat, colors[2]);
                solution.insert({user_info.first, user_sat});
                count_users++;

                // set that the user has been assigned to this current satellite and given color c
                possible_users[i].second.first = true;
                possible_users[i].second.second = colors[2];
            } else if (color_d == false) {
                // can use color_d for current user
                std::pair<Sat, Color> user_sat(cur_sat, colors[3]);
                solution.insert({user_info.first, user_sat});
                count_users++;

                // set that the user has been assigned to this current satellite and given color d
                possible_users[i].second.first = true;
                possible_users[i].second.second = colors[3];
            }
        }
    }

    return solution;
}
