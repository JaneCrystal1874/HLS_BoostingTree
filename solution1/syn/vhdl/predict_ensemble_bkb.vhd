-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bkb_rom is 
    generic(
             DWIDTH     : integer := 1; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_bkb_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 8=> "0", 9 => "1", 10 to 19=> "0", 20 to 22=> "1", 23 to 27=> "0", 28 to 29=> "1", 30 to 34=> "0", 
    35 to 44=> "1", 45 to 46=> "0", 47 => "1", 48 to 58=> "0", 59 => "1", 60 to 61=> "0", 62 to 63=> "1", 
    64 to 65=> "0", 66 => "1", 67 to 68=> "0", 69 => "1", 70 to 76=> "0", 77 => "1", 78 to 79=> "0", 
    80 => "1", 81 => "0", 82 => "1", 83 => "0", 84 to 87=> "1", 88 => "0", 89 => "1", 
    90 => "0", 91 to 98=> "1", 99 to 102=> "0", 103 to 104=> "1", 105 => "0", 106 => "1", 107 to 114=> "0", 
    115 to 118=> "1", 119 to 122=> "0", 123 to 128=> "1", 129 to 130=> "0", 131 to 134=> "1", 135 => "0", 136 to 137=> "1", 
    138 => "0", 139 => "1", 140 => "0", 141 => "1", 142 => "0", 143 to 151=> "1", 152 => "0", 
    153 to 155=> "1", 156 => "0", 157 to 158=> "1", 159 => "0", 160 => "1", 161 => "0", 162 to 164=> "1", 
    165 => "0", 166 to 176=> "1", 177 => "0", 178 to 180=> "1", 181 to 194=> "0" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_bkb is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_bkb is
    component predict_ensemble_bkb_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bkb_rom_U :  component predict_ensemble_bkb_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


