package com.les.LesHotel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.les.LesHotel.entities.HospedagemAluguel;

@Repository
public interface HospedagemRepository extends JpaRepository<HospedagemAluguel, Long> {

}
