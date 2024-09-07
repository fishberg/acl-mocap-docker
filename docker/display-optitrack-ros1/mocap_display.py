#!/usr/bin/env python

import argparse
import rospy
from geometry_msgs.msg import PoseStamped
import numpy as np
from tabulate import tabulate
import pandas as pd
import os
#import curses
#import time

from scipy.spatial.transform import Rotation as Rot


class MocapTopicHandler:
    def __init__(self, myID, dim=3):
        self.myID = myID

        self.topic = f'/optitrack/{self.myID}/world'
        self.sub = rospy.Subscriber(self.topic, PoseStamped, self.callback)
        self.dim = dim

        self.bins = {}
        if dim == 3:
            self.bins['x'] = np.nan
            self.bins['y'] = np.nan
            self.bins['z'] = np.nan
            self.bins['roll'] = np.nan
            self.bins['pitch'] = np.nan
            self.bins['yaw'] = np.nan
            self.keys = ['x','y','z','roll','pitch','yaw']
        elif dim == 2:
            self.bins['x'] = np.nan
            self.bins['y'] = np.nan
            self.bins['yaw'] = np.nan
            self.keys = ['x','y','yaw']
        else:
            assert False

    def callback(self,data):
        if self.dim == 3:
            qx = data.pose.orientation.x
            qy = data.pose.orientation.y
            qz = data.pose.orientation.z
            qw = data.pose.orientation.w
            rot = Rot.from_quat([qx,qy,qz,qw])
            rx,ry,rz = np.rad2deg(rot.as_euler('xyz'))

            self.bins['x'] = data.pose.position.x
            self.bins['y'] = data.pose.position.y
            self.bins['z'] = data.pose.position.z
            self.bins['roll'] = rx
            self.bins['pitch'] = ry
            self.bins['yaw'] = rz
        elif self.dim == 2:
            qx = data.pose.orientation.x
            qy = data.pose.orientation.y
            qz = data.pose.orientation.z
            qw = data.pose.orientation.w
            rot = Rot.from_quat([qx,qy,qz,qw])
            rz,_,_ = np.rad2deg(rot.as_euler('zyx'))

            self.bins['x'] = data.pose.position.x
            self.bins['y'] = data.pose.position.y
            self.bins['yaw'] = rz
        else:
            assert False

def topic_handlers_dataframe(topic_handlers):
    matrix = {}
    for topic_handler in topic_handlers:
        row = topic_handler.myID
        cols = []
        bins = topic_handler.bins
        for key in topic_handler.keys:
            cols.append(bins[key])
        matrix[row] = cols
    
    df = pd.DataFrame.from_dict(matrix,orient='index',columns=topic_handler.keys)
    return df

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('idx',type=str,nargs='+')
    parser.add_argument('--dim','-d',type=int,default=3)
    parser.add_argument('--rate','-r',type=int,default=4)
    args = parser.parse_args()
    rospy.init_node('mocap_display')
    rate = rospy.Rate(args.rate)

    topic_handlers = []
    for n in args.idx:
        topic_handlers.append(MocapTopicHandler(n,dim=args.dim))
    rate.sleep()

    while not rospy.is_shutdown():
        df = topic_handlers_dataframe(topic_handlers)
        output = tabulate(df, headers='keys', tablefmt='psql', floatfmt='.2f')

        os.system('clear')
        print(output,flush=True)

        rate.sleep()
