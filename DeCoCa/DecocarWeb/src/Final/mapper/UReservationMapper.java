
//�ϴ� ���� ����� ����, ReservationMapper�� ����Ǹ� ������..
package Final.mapper;

import java.util.ArrayList;
import Final.vo.Reservation;
public interface UReservationMapper {
	public void insert(Reservation obj);
	public void delete(String obj);
	public void update(Reservation obj);
	public Reservation select(String obj);
	public ArrayList<Reservation> selectAll(String obj);	
}
