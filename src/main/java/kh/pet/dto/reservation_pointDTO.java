package kh.pet.dto;

public class reservation_pointDTO {
		private int reservation_point_seq;
		private String reservation_seq;
		private int reservation_point;
		
		public reservation_pointDTO() {}
		
		public reservation_pointDTO(int reservation_point_seq, String reservation_seq, int reservation_point) {
			super();
			this.reservation_point_seq = reservation_point_seq;
			this.reservation_seq = reservation_seq;
			this.reservation_point = reservation_point;
		}
		public int getReservation_point_seq() {
			return reservation_point_seq;
		}
		public void setReservation_point_seq(int reservation_point_seq) {
			this.reservation_point_seq = reservation_point_seq;
		}
		public String getReservation_seq() {
			return reservation_seq;
		}
		public void setReservation_seq(String reservation_seq) {
			this.reservation_seq = reservation_seq;
		}
		public int getReservation_point() {
			return reservation_point;
		}
		public void setReservation_point(int reservation_point) {
			this.reservation_point = reservation_point;
		}
		
}
