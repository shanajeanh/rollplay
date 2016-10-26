import React, { Component } from 'react';
import Skill from './Skill';

const Skills = props => {
  let skills = props.data.map(skill => {
    return (
      <Skill
        
      />
    );
  });
  return (
    <div>
      {skills}
    </div>
  );
}

export default Skills;
